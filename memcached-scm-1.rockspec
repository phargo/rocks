package = 'memcached'
version = 'scm-1'

source  = {
    url    = 'git://github.com/tarantool/memcached.git';
    branch = 'master';
}

description = {
    summary  = "Memcached protocol module for tarantool";
    homepage = 'https://github.com/tarantool/memcached';
    license  = 'BSD';
    maintainer = "Eugine Blikh <bigbes@tarantool.org>";
}

dependencies = {
    'lua >= 5.1';
}

external_dependencies = {
    TARANTOOL = {
        header = 'tarantool/tarantool.h'
    };
    SMALL = {
        header = 'small/slab_cache.h'
    };
}

build = {
    type = 'builtin',

    modules = {
        ['memcached'] = 'memcached/init.lua';
        ['memcached.internal'] = {
            incdirs = {
                '$(TARANTOOL_INCDIR)/tarantool',
                '$(SMALL_INCDIR)/small',
                'third_party'
            },
            libraries = {
                'small'
            },
            sources = {
                'memcached/internal/memcached.c',
                'memcached/internal/memcached_constants.c',
                'memcached/internal/memcached_layer.c',
                'memcached/internal/memcached_network.c',
                'memcached/internal/memcached_persistent.c'
            };
        }
    }
}
-- vim: syntax=lua ts=4 sts=4 sw=4 et
