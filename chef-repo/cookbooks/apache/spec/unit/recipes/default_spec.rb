#
# Cookbook Name:: apache
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs apache' do
      expect(chef_run).to install_package 'apache2'
    end

    it 'starts apache' do
      expect(chef_run).to start_service 'apache2'
    end

    it 'enables apache to start on reboot' do
      expect(chef_run).to enable_service 'apache2'
    end








  end
end
