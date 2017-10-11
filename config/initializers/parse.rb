require 'parse/stack'

# Set your specific Parse keys in your ENV. For all connection options, see
# https://github.com/modernistik/parse-stack#connection-setup
Parse.setup app_id: ENV['PARSE_APP_ID'],
        master_key: ENV['PARSE_MASTER_KEY'],
        server_url: 'https://esmasseguro.azurewebsites.net/parse'
        # optional
        #    logging: false,
        #      cache: Moneta.new(:File, dir: 'tmp/cache'),
        #    expires: 1 # cache ttl 1 second

Parse.auto_generate_models!