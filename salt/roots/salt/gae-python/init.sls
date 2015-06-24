include:
  - java7

python:
  pkg:
    - installed

gcloud-sdk:
  cmd.run:
    - onlyif: 'test ! -e /home/vagrant/google-cloud-sdk/bin/gcloud'
    - name: |
        wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip
        unzip google-cloud-sdk.zip
        pushd google-cloud-sdk
        CLOUDSDK_CORE_DISABLE_PROMPTS=1 ./install.sh --disable-installation-options --path-update=true --bash-completion=true --rc-path=/home/vagrant/.bashrc
        popd
    - require:
      - pkg: python
      - sls: java7
    - user: vagrant


gcloud-python-tools:
  cmd.run:
    - name: 'export CLOUDSDK_CORE_DISABLE_PROMPTS=1 && /home/vagrant/google-cloud-sdk/bin/gcloud components update gae-python'
    - user: vagrant
    - require:
      - cmd: gcloud-sdk
    
