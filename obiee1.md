
root user


nohup /data/obiee/wlserver_10.3/server/bin/startNodeManager.sh > /tmp/startNodeManager.log 2>&1 &


nohup /data/obiee/user_projects/domains/bifoundation_domain/bin/startWebLogic.sh > /tmp/weblogic.log 2>&1 &


oracle user
/data/obiee/instances/instance1/bin/opmnctl startall
/data/obiee/instances/instance1/bin/opmnctl stopall
/data/obiee/instances/instance1/bin/opmnctl status
opmnctl stopall
opmnctl startall
opmnctl status
