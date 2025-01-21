# Remove unnecessary software
echo "=> Cleaning up..."
bash -c "sudo apt-get autopurge docker-{buildx-plugin,ce{,-cli}} containerd.io podman buildah skopeo containers-common kubectl \
adoptium-ca-certificates {openjdk,adoptopenjdk,temurin,nginx,apache2,php,vim,{,lib}mono,gfortran,postgresql,libgtk-3,ant{,-optional} \
libpq-dev libmysqlclient* msodbcsql* mssql-tools unixodbc-dev mysql-client* mysql-common mysql-server* php*-*sql sphinxsearch mongodb* \
firefox {google-chrome,microsoft-edge}-stable xvfb apache2 nginx php{7,8}* session-manager-plugin {azure,google-cloud}-cli heroku subversion \
mercurial vim dotnet* aspnetcore* mono{doc}* libmono* msbuild nuget ruby* rake ri powershell r-{base,cran,doc}* r-recommended snapd man{-db,pages} \
ubuntu-mono *-icon-theme esl-erlang imagemagick{,-6-common} libgl1-mesa-dri firebird* hhvm"
echo "=> Preparing software..."
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential bison m4 perl gawk
echo "=> The good ending (should be)"
