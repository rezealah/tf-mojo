[{
	"dnsSearchDomains": null,
	"logConfiguration": {
		"logDriver": "awslogs",
		"secretOptions": null,
		"options": {
			"awslogs-group": "${awslogs-group}",
			"awslogs-region": "${region}",
			"awslogs-stream-prefix": "ecs"
		}
	},
	"entryPoint": null,
	"portMappings": [{
		"hostPort": 3000,
		"protocol": "tcp",
		"containerPort": 3000
	}],
	"command": null,
	"linuxParameters": null,
	"cpu": 0,
	"environment": [{
		"name": "MONGODB_URI",
		"value": "db"
	}],
	"memoryReservation": 512,
	"volumesFrom": [],
	"image": "rezealah/api",
	"name": "api"
}, {
	"dnsSearchDomains": null,
	"logConfiguration": {
		"logDriver": "awslogs",
		"secretOptions": null,
		"options": {
			"awslogs-group": "${awslogs-group}",
			"awslogs-region": "${region}",
			"awslogs-stream-prefix": "ecs"
		}
	},
	"entryPoint": null,
	"command": null,
	"linuxParameters": null,
	"cpu": 0,
	"memoryReservation": 512,
	"volumesFrom": [],
	"image": "mongo",
	"name": "db"
}]