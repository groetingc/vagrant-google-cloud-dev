#wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
#sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu trusty-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
#sudo apt-get update
#sudo apt-get install pycharm

include:
  - java7

pycharm-pre-clean:
  cmd.run:
    - unless: which pycharm
    - name: | 
        apt-get clean
        apt-get update

pycharm-ppa:
  pkgrepo.managed:
    - humanname: Pycharm PPA
    - name: deb http://archive.getdeb.net/ubuntu trusty-getdeb apps
    - file: /etc/apt/sources.list.d/getdeb.list
    - key_url: http://archive.getdeb.net/getdeb-archive.key

pycharm:
  pkg:
    - installed
    - require:
      - pkgrepo: pycharm-ppa
      - sls: java7

