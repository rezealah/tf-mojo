[
  {
    "name": "${name}",
    "image": "rezealah/api:latest",
    "cpu": 512,
    "memory": 1024,
    "memoryReservation": 1024,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 0
      }
    ],
    "environments": [
      {
        "name": "MONGODB_URI",
		    "value": "db"
      }
    ]
  },
    {
    "name": "db",
    "image": "mongo",
    "cpu": 512,
    "memory": 1024,
    "memoryReservation": 1024,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 27017,
        "hostPort": 0
      }
    ],
    "environments": [
      {
        "name": "MONGODB_URI",
		    "value": "db"
      }
    ]
  }
]