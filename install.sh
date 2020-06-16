#!/usr/bin/env bash

echo  'test';

run_composer() {
  docker run --rm --interactive --tty --volume .:/app $1
}


MAGENTO_DIR="magento"
MAGENTO_VER="$1"
if [ -z "$MAGENTO_VER" ]; then
  MAGENTO_INSTALL="magento/project-community-edition"
else
  MAGENTO_INSTALL="magento/project-community-edition=" . $MAGENTO_VER
fi

run_composer composer create-project --repository-url=https://repo.magento.com/ $MAGENTO_INSTALL .

