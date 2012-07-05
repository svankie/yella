# coding: utf-8

ld = File.dirname(__FILE__)
$LOAD_PATH.unshift(ld) unless $LOAD_PATH.include?(ld)

module Yella
  VERSION = '0.0.1'
  ROOT_DIR = File.dirname(__FILE__)
end

require 'yella/yella'
