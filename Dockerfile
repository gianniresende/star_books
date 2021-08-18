FROM ruby:2.7.1

RUN curl -sL https://nsolid-deb.nodesource.com/nsolid_setup_4.x | bash -

# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nsolid-fermium nsolid-console yarn build-essential libpq-dev imagemagick git-all nano vim \
libmagickcore-dev libmagickwand-dev

# path
ENV INSTALL_PATH /app

# Create directiory
RUN mkdir -p $INSTALL_PATH

# Set main directiory
WORKDIR $INSTALL_PATH

# Set permissions
RUN chmod -R 777 $INSTALL_PATH

# Gem file
COPY Gemfile ./

# Set the path for Gems
ENV BUNDLE_PATH /gems

# Copy for inside the container
COPY . .
