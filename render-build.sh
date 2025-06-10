#!/usr/bin/env bash

# Nokogiriのエラー対策（GLIBCがRenderに合わないのでRubyプラットフォームを強制）
bundle config set force_ruby_platform true

# 通常のビルド処理
bundle install
yarn install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rails webpacker:compile
bundle exec rake db:migrate
