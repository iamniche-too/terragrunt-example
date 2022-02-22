export ENV=dev
#export ENV=prod

#TERRAFORM_VERSION=`terraform --version`
TERRAGRUNT_VERSION=`terragrunt --version`

# check version
if [ "$TERRAGRUNT_VERSION" != "terragrunt version v0.26.7" ];
then
  echo "Please use Terragrunt version 0.26.7 ..." && exit 0
fi

echo "Using $TERRAGRUNT_VERSION"