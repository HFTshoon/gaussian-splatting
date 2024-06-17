import os

scene_name_list = [
	"bicycle",  # 0
	"bonsai",   # 1
	"counter",  # 2
	"fox",      # 3
	"garden",   # 4
	"kitchen",  # 5
	"room",     # 6
	"stump"     # 7
]

scene_idx = 7
level = 0
use_f = True
use_ori = True

scene_name = scene_name_list[scene_idx]
if use_ori:
    sg_path = "supergaussians_ori"
elif use_f:
    sg_path = "supergaussians_f"
else:
    sg_path = "supergaussians_no_f"


cluster_info = f"../{sg_path}/{scene_name}_level_{level}.ply"
point_cloud_des = f"./output/{scene_name}_3/point_cloud/iteration_30000/point_cloud.ply"

print(f"copy {cluster_info} {point_cloud_des}")
# os.system(f"copy {cluster_info} {point_cloud_des}")
print(f"./viewers/bin/SIBR_gaussianViewer_app -m ./output/{scene_name}_3")
# os.system(f"./viewers/bin/SIBR_gaussianViewer_app -m ./output/{scene_name}_3")

