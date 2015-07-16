# title


Run your Python WSGI application with Docker. No pain.




## Considerations

If you 


- Make sure that the ```requirements.txt``` file is in the top level of your project.
- ```wsgi``` module.


## Usage


## Misc

All socket and pid files are kept under ```/tmp```:

- gunicorn.pid
- gunicorn.sock
- nginx.pid
- supervisord.pid
- supervisord.sock




## Out of the Box

- Nginx
- PostgreSQL
- Python (```pip``` & ```virtualenv```)
- Redis


## License

Copyright © 2015 Jorge Romero. Released under The MIT License.