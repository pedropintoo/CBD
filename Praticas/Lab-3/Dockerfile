FROM cassandra:4

# Enable user-defined functions by modifying the configuration
RUN sed -i -r 's/^user_defined_functions_enabled: false/user_defined_functions_enabled: true/' /etc/cassandra/cassandra.yaml
