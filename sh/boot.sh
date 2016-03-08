if [ $1 = "cookpad" ]; then
  cd cookpad
  USE_SSO_SERVER=1 bundle exec foreman start -m "memcached=1,ttserver=1,redis=1,rails=0,rails_sso=1" &
  bundle exec rails s -b 0.0.0.0 -p 3000
  return
elif [ $1 = "papa" ]; then
  cd papa
  USE_SSO_SERVER=1 bundle exec foreman start -m "memcached=1,ttserver=1,redis=1,rails=0,rails_sso=1" &
  bundle exec rails s -b 0.0.0.0 -p 3001
  return
fi
