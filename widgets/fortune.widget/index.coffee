
###########################
# CHANGE STYLE IF DESIRED #
###########################

command: "/usr/local/bin/fortune"

refreshFrequency: 3600000 # 1 hour


style: """
    top                100px
    left               800px
    background         rgba(#000, .5)
    color              #fff
    padding            10px
    border-radius      5px
    font-family        Helvetica Neue
    font-size          16px
    width              300px

    .cjdns
        font-size      11px
        padding        0 0 5px

        &:after
            content    ''
            font-size: 16px
"""
render: (lag) -> """
<div class="ms">
	#{lag} ms
</div>
"""
