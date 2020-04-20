import dracula.draw

# Load existing settings made via :set
# config.load_autoconfig()

c.auto_save.session = True
c.session.lazy_restore = True
c.tabs.position = "left"
c.tabs.show = "multiple"
c.tabs.width = 30
c.tabs.indicator.width = 1
dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}&k7=282a36&k8=f8f8f2&k9=50fa7b&kae=t&kt=p&ks=m&kw=n&km=l&ko=s&kj=282a36&ka=p&kaa=bd93f9&ku=-1&kx=f1fa8c&ky=44475a&kaf=1&kai=1&kf=1',
    'g': 'https://google.com/search?q={}',
    's': 'https://startpage.com/search?q={}',
    'r': 'https://reddit.com/r/{}',
    "osm": "https://www.openstreetmap.org/search?query={}",
}

