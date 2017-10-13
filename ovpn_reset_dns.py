import os

ovpn_dir = '/etc/openvpn/'


for file in os.listdir(ovpn_dir):
    if '.conf' in file:
        print(file)
        # output_changed_content
        out_content = []
        with open(os.path.join(ovpn_dir,file) , 'r') as f:
            out_content = f.readlines()
            # replace 1st option
            try:
               index = out_content.index('push "dhcp-option DNS 8.8.8.8"\n')
               out_content[index] = 'push "dhcp-option DNS 172.17.0.1"\n'
            except Exception as e:
               print('Error: ' + str(e))

            # replace 1st option
            try:
               index = out_content.index('push "dhcp-option DNS 8.8.4.4"\n')
               out_content.pop(index)
            except Exception as e:
               print('Error: ' + str(e))
           
            print(out_content)

        with open(os.path.join(ovpn_dir,file) , 'w') as f:
            f.writelines(out_content)
            