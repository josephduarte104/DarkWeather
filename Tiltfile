docker_build('dark-weather-image', '.')
k8s_yaml('kube-dark-manual.yaml')
allow_k8s_contexts('default')
k8s_resource('dark-weather-deployment', port_forwards=5001)
