# this state file installs node.js ( v0.10.37 )
nodejs-ppa:
    pkgrepo.managed:
    - humanname: Node.js PPA
    - ppa: chris-lea/node.js

nodejs:
  pkg:
    - installed
    - require:
      - pkgrepo: nodejs-ppa