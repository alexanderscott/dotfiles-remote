#!/bin/bash

cd "$(dirname "$0")"

echo "   Installing Ruby env"

mkdir -p ~/.rvm/hooks 
cp rvm/hooks/after_use_jruby_drip ~/.rvm/hooks/
