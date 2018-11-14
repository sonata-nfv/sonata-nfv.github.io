#!/bin/bash
user="sonata.dem"					###### project user name
password="s0nata.d3m"				###### project password
tenant="sonata.dem"					###### project name
vim_ip="10.100.32.200"				###### IP of the VIM
router="e8cdd5c7-191f-4215-83f3-53ee1113db86"		###### sonata/tango router uuid in OpenStack
ext_net="53d43a3e-8c86-48e6-b1cb-f1f2c48833de"		###### uuid of the external/provider network connected to the router
city="city"						###### City Name
country="country"					###### Country Name
name="name"					###### Vim Name

/usr/bin/docker exec -t son-postgres psql -h localhost -U sonatatest -d vimregistry -c \
"INSERT INTO VIM (UUID, TYPE, VENDOR, ENDPOINT, USERNAME, CONFIGURATION, CITY, COUNTRY, PASS, AUTHKEY, NAME, DOMAIN) VALUES \
('1111-22222222-33333333-4444', 'compute', 'Heat', '$vim_ip', '$user', \
'{\"tenant_ext_net\":\"$ext_net\", \"tenant_private_net_id\":\"10.0.0.0\", \"tenant_private_net_length\":8, \"tenant\":\"$tenant\", \"tenant_ext_router\":\"$router\"}', \
'$city', '$country', '$password', null, '$name', 'default');"
/usr/bin/docker exec -t son-postgres psql -h localhost -U sonatatest -d vimregistry -c \
"INSERT INTO VIM (UUID, TYPE, VENDOR, ENDPOINT, USERNAME, CONFIGURATION, CITY, COUNTRY, PASS, AUTHKEY, NAME, DOMAIN) VALUES \
('aaaa-bbbbbbbb-cccccccc-dddd', 'network', 'ovs', '$vim_ip', '$user', '{"compute_uuid":"1111-22222222-33333333-4444"}', \
'$city', '$country', '$password', null,'$name','default');"
/usr/bin/docker exec -t son-postgres psql -h localhost -U sonatatest -d vimregistry -c \
"INSERT INTO LINK_VIM (COMPUTE_UUID, NETWORKING_UUID) VALUES ('1111-22222222-33333333-4444', 'aaaa-bbbbbbbb-cccccccc-dddd');"
/usr/bin/docker exec -t son-postgres psql -h localhost -U postgres -d wimregistry -c \
"INSERT INTO WIM (UUID, TYPE, VENDOR, ENDPOINT, USERNAME, PASS, AUTHKEY, NAME) VALUES ('1234-12345678-12345678-1234', 'WIM', 'MOCK', '10.0.0.1', 'admin', 'admin', null, 'MadridWan');"
/usr/bin/docker exec -t son-postgres psql -h localhost -U postgres -d wimregistry -c \
"INSERT INTO ATTACHED_VIM (VIM_UUID, VIM_ADDRESS, WIM_UUID) VALUES ('1111-22222222-33333333-4444','$vim_ip', '1234-12345678-12345678-1234');"
