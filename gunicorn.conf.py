# import multiprocessing

bind = "0.0.0.0:5000"  # Bind to all available network interfaces
# workers = multiprocessing.cpu_count() * 2 + 1  # Use formula to determine the number of workers
# worker_class = "gthread"  # Use threads for concurrency
# threads = multiprocessing.cpu_count() * 2  # Use twice as many threads as there are workers
# worker_connections = 1000  # Maximum number of simultaneous clients

# # Daemonize the process, detach from the terminal, and run in the background
# daemon = True
# pidfile = "/var/run/gunicorn.pid"

# # Set the user and group that the server will run as
# user = "nobody"
# group = "nogroup"

# # Set the maximum number of requests a worker will process before restarting
# max_requests = 1000
# max_requests_jitter = 50

# # Timeout for worker processes to gracefully finish execution
# timeout = 30

# # Enable pre-fork mode to avoid expensive process creation on each request
# preload_app = True
