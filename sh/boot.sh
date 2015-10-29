if [ $1 = "cookpad" ]; then
  USE_SSO_SERVER=1 bundle exec foreman start -m "memcached=1,ttserver=1,redis=1,rails=0,rails_sso=1" &
  bundle exec rails s
  return
fi
