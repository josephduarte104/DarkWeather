docker_build('dark-weather-image', '.')
k8s_yaml('kube-dark-manual.yaml')
allow_k8s_contexts('k3d-sys76')
k8s_resource('dark-weather-deployment', port_forwards=5001)
