# courtesy of vanvlack
function provision_rds --description 'provision rds database'

      # make sure AWS-Vault is ready
      if test -z $AWS_SESSION_TOKEN
            set_color red
            echo "Must have aws shell enabled!!"
            return 1
      end

      read -p "echo 'ENV: '" -lx ENV
      read -p "echo 'SERVICE: '" -lx SERVICE
      read -p "echo 'DATABASE REGION: '" -l DATABASE_REGION
      read -p "echo 'RDS ENDPOINT: '" -lx PGHOST

      set -lx ADMIN_USER ops
      set -lx PGUSER app.$SERVICE.$ENV.banksimple.com
      set -lx PGPASSWORD $PGUSER
      set -lx ADMIN_PASSWORD (aws --region $DATABASE_REGION secretsmanager get-secret-value --secret-id /$ENV/rds/$SERVICE/admin-password --query SecretString | tr -d '"')
      set -lx MONITORING_PASSWORD (aws --region us-west-1 secretsmanager get-secret-value --secret-id /rds/global/monitoring --query SecretString | jq --raw-output '.' | jq '.hash' | tr -d '"')

      # env SERVICE=$SERVICE ENV=$ENV ADMIN_USER=xxx ADMIN_PASSWORD=xxx PGUSER=app.myservicename.dev.banksimple.com PGHOST=$RDS_ENDPOINT

      ./databass/scripts/provision.sh
end
