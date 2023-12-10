# constant
REPO="klimdos/alimov.online"
ARTEFACT_VERSION="$(git describe --long --always | sed -r "s/-(([^-]*-){1}[^-]*)$/.\\1/")"

# creating app version
echo "ARTEFACT_VERSION=${ARTEFACT_VERSION}" > src/.env


# building
echo "building ${REPO}:${ARTEFACT_VERSION}"
docker build --build-arg ARTEFACT_VERSION=${ARTEFACT_VERSION} -t ${REPO}:${ARTEFACT_VERSION} .

# pushing
echo "pushing ${REPO}:${ARTEFACT_VERSION}"
docker push ${REPO}:${ARTEFACT_VERSION}
