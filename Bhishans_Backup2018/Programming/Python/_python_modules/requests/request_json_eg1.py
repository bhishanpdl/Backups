#!python
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jan 7, 2017
# Last update :
# Est time    :

# Imports
import json
import requests

url = 'http://maps.googleapis.com/maps/api/directions/json'

def main():
    

    params = dict(
        origin='Chicago,IL',
        destination='Los+Angeles,CA',
        waypoints='Joplin,MO|Oklahoma+City,OK',
        sensor='false'
    )

    resp = requests.get(url=url, params=params)
    data = json.loads(resp.text)
    # print(data)

    # example 2
    r = requests.get('https://github.com/timeline.json')
    # print(r.json())

    data = r.json()
    msg = data['message']
    print(msg)

if __name__ == '__main__':
    main()
