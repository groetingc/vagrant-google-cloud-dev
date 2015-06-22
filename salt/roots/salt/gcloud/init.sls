# gcloud install
#echo "deb http://archive.canonical.com/ubuntu $(lsb_release -c -s) partner" | sudo tee /etc/apt/sources.list.d/partner.list
#sudo apt-get update
#sudo apt-get -y install google-cloud-sdk

include:
  - java7

python:
  pkg:
    - installed

python-software-properties:
  pkg:
    - installed

gcloud-ppa:
  cmd.run:
    - unless: test -f /usr/bin/gcloud
    - name: '/bin/echo "deb http://archive.canonical.com/ubuntu $(lsb_release -c -s) partner" | sudo tee /etc/apt/sources.list.d/partner.list'
    - require_in:
      - pkg: google-cloud-sdk
 
 
google-cloud-sdk:
  pkg:
    - installed
    - require: 
      - cmd: gcloud-ppa
      - sls: java7


 

