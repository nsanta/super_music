class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  protected

  def resource_not_found
    render nothing: true, status: 404
  end

  def response_success(resource, meta_data = {}, status = 200)
    render json: { data: represent(resource), meta: meta_data }, status: status
  end

  def response_error(operation)
    errors = build_errors(operation)
    render json: { errors: errors[:errors] }, status: errors[:status]
  end

  def represent(resource)
    if resource.is_a?(Array) || resource.is_a?(ActiveRecord::Relation)
      resource.map { |r| represent_class(r).new(r) }
    else
      represent_class(resource).new(resource)
    end
  end

  def represent_class(resource)
    "#{resource.class.name}::Representer".constantize
  end

  def build_errors(operation)
    if contract_error?(operation)
      { errors: operation['result.contract.default'].errors.messages, status: :bad_request }
    else
      { nothing: true, status: :unprocessable_entity }
    end
  end

  def policy_error?(operation)
    operation['result.policy.default'] && !operation['result.policy.default'].success?
  end

  def contract_error?(operation)
    operation['result.contract.default'] && !operation['result.contract.default'].success?
  end
end
