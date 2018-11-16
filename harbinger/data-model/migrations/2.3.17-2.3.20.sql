-- old: 2.3.17 a32297c723c2f25bc123b77a8eb8b5d111b6834d
-- new: 2.3.20 9ced04914b20df287444c1be82727ba3d7fc5ac3

ALTER TABLE data_manager_static_routes                                                                                                                        
        DROP COLUMN incoming_host,                                                                                                                            
        DROP COLUMN incoming_exchange,                                                                                                                        
        DROP COLUMN incoming_routing_key_matcher,                                                                                                             
        DROP COLUMN outgoing_host,                                                                                                                            
        DROP COLUMN outgoing_exchange,                                                                                                                        
        DROP COLUMN outgoing_routing_key,                                                                                                                     
        ADD COLUMN source_host text NOT NULL,                                                                                                                 
        ADD COLUMN source_exchange text NOT NULL,                                                                                                             
        ADD COLUMN source_routing_key_matcher text NOT NULL,                                                                                                  
        ADD COLUMN destination_host text NOT NULL,                                                                                                            
        ADD COLUMN destination_exchange text NOT NULL,                                                                                                        
        ADD COLUMN destination_routing_key_transformer text,                                                                                                  
        ADD COLUMN autostart boolean DEFAULT false NOT NULL,                                                                                                  
        ADD COLUMN created_at timestamp with time zone DEFAULT now() NOT NULL;                                                                                
                                                                                                                                                              
ALTER TABLE data_manager_static_routes                                                                                                                        
        ADD CONSTRAINT data_manager_static_routes_pk PRIMARY KEY (id);

UPDATE configuration_variables SET configuration_value='9ced04914b20df287444c1be82727ba3d7fc5ac3', updated_at=now() WHERE configuration_key='data-model-commit-id';
