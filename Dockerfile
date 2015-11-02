FROM debian:jessie
RUN apt-get update && apt-get install -y --no-install-recommends \
			gcc \
			gdb \
			libffi-dev \
			libltdl-dev \
			libtool \
			libtool-bin \
			m4 \
			make \
			wget \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

ENV GFORTH_VERSION 0.7.1

RUN wget -O - http://ftp.gnu.org/gnu/gforth/gforth-$GFORTH_VERSION.tar.gz | \
	tar zxv -C /tmp && \
	cd /tmp/gforth-$GFORTH_VERSION && \
	./configure --prefix=/usr --exec-prefix=/usr && \
	make && \
	make install && \
	libtool --finish /usr/lib/gforth/0.7.3/libcc-named/ && \
	cd /tmp && rm -rf gforth-$GFORTH_VERSION

CMD ["/usr/bin/gforth"]
