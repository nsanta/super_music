class ApplicationController < ActionController::API
  protected

  def response_success(resource, status = 200, meta_data = {})
    render json: { data: represent(resource), meta: meta_data }, status: status
  end

  def response_error(operation)
    render errors(operation)
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

  def errors(operation)
    if policy_error?(operation)
      { nothing: true, status: :unauthorized }
    elsif contract_error?(operation)
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
