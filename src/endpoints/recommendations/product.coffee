_ = require 'lodash'
EndpointHelper = require "#{ __dirname }/../../lib/endpoint_helper"
Request = require 'request'

module.exports = (options, callback) ->

  productId = 'pp5004200088'
  reqOpts =
    headers: { 'Content-Type': 'application/json' }
    qs: { id: productId }
    uri: "#{ options.environment.baseURL }/recommendations/product"

  EndpointHelper.describeRequest "Fetching recommendations for product #{ productId }...", reqOpts

  Request reqOpts, _.partialRight(EndpointHelper.handleResponse, callback)