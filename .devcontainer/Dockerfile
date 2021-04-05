FROM elixir:1.11.4

ENV MIX_ENV dev
ENV ERL_AFLAGS -kernel shell_history enabled
RUN printf "IEx.configure(colors: [eval_result: [:cyan, :bright]])\n" >> ~/.iex.exs

RUN echo "deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /" | tee /etc/apt/sources.list.d/shells:fish:release:3.list
RUN curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -yq \
    fish \
    groff \
    inotify-tools \
    less \
    locales \
    man \
    vim

RUN sed -i "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen
RUN locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN curl -L https://get.oh-my.fish > /tmp/install-oh-my-fish
RUN fish /tmp/install-oh-my-fish --noninteractive
ENV SHELL /usr/bin/fish

RUN /usr/bin/fish -c "omf install agnoster"
RUN /usr/bin/fish -c "omf theme agnoster"

RUN curl -o /usr/local/bin/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
RUN chmod a+x /usr/local/bin/diff-so-fancy

RUN mkdir ~/.ssh
RUN touch ~/.ssh/known_hosts
RUN ssh-keyscan -H github.com >> ~/.ssh/known_hosts

RUN mix local.rebar --force && mix local.hex --force
