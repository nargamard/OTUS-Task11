# /bin/bash

## Убираем всё из known_hosts, потому что не получилось сделать так,
## чтобы при выполнении ansible-playbook known_hosts не проверялся 
echo "" > ~/.ssh/known_hosts 

echo "Создаём виртуальную машину vagrant"
cd vagrant && vagrant up

sleep 60
vagrant snapshot push

echo "Выполняем действия над vagrant машиной"
ansible-playbook ../ansible/playbooks/nginx.yaml