#!/bin/bash
rake db:drop
rake db:create
rake db:migrate VERSION=0
rake db:migrate
rake db:seed
