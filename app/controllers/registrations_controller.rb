# class RegistrationsController < Devise::RegistrationsController
#   def create
#     puts request
#     puts "x"*300
#     puts request.parameters
#     puts "x"*300
#     puts request.params
#     puts "x"*300
#     puts resource
#     puts params
#     puts sign_up_params
#     puts "x"*300
#     build_resource(sign_up_params)

#     resource.save
#     render_resource(resource)
#   end
# end