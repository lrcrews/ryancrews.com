set :stage, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

# these are being defined below in the server setup

# role :web, 'ec2-54-186-130-216.us-west-2.compute.amazonaws.com' #(http server, like Apache)
# role :app, 'ec2-54-186-130-216.us-west-2.compute.amazonaws.com' # same as the web role?
# role :db, 'ec2-54-186-130-216.us-west-2.compute.amazonaws.com' # so RDS?  But can I just use local mysql on ec2 linux box?


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'ec2-54-148-235-140.us-west-2.compute.amazonaws.com', 
	roles: %w{web app db},
	ssh_options: {
		user: 'ubuntu',
		keys: %w(~/ryancrews.com/blog/config/aws/keys/rc_blog_key_pair_feb_1_2015.pem),
		forward_agent: false,
		auth_methods: %w(publickey password)
	}

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
 # set :ssh_options, {
 #   keys: [  ]#,
   # forward_agent: false,
   # auth_methods: %w(password)
 #}
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
