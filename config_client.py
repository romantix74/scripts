import os

out_dir = 'out'

in_file = 'input.txt'

#читаем файл
with open(in_file) as f:
	c = f.readlines();

# read ovpn template
template_file_path = 'template.ovpn'
out_ovpn_file_content = []
with open(template_file_path, 'r', encoding='utf-8') as f:
	out_ovpn_file_content = f.readlines()
print(out_ovpn_file_content[5])
	
for i in c:
	print(i.split())
	dir_pc = i.split()[0]
	server = i.split()[1]
	login = i.split()[2]
	password = i.split()[3]
	print(login + ' ' + password)
	subdir = os.path.join(out_dir,dir_pc)
	
	#create subdir for every PCs
	if not os.path.exists(subdir):
		os.makedirs(subdir)
		
	# create auth file
	out_auth_file_path = os.path.join(subdir, 'auth.txt')
	out_auth_file_content = []
	out_auth_file_content.append(login + '\n')
	out_auth_file_content.append(password + '\n')
	with open(out_auth_file_path, 'w') as f:
		f.writelines(out_auth_file_content)
	
	# replace server string 
	out_ovpn_file_content[5] = server
	print(out_ovpn_file_content[5])
	
	# create ovpn_file
	out_ovpn_file_path = os.path.join(subdir, 'secretvpn.net.ovpn')
	with open(out_ovpn_file_path, 'w',encoding='utf-8') as f:
		f.writelines(out_ovpn_file_content)