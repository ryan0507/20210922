import sys
import os
import runpy
path = os.path.dirname(sys.modules[__name__].__file__)
path = os.path.join(path, '..')
sys.path.insert(0, path)
sys.argv[1:] = ['--mode','train_and_eval', '--experiment', 'assemblenetplus_ucf101',
                  '--model_dir','gs://yonsei-tf2-models/asn2/Assemblenet_20210824',
                  '--config_file', '/home/yonsei/20210818/asn/asnplus.yaml',
                  '--tpu', 'node-3']
runpy.run_module('official.vision.beta.projects.assemblenet.train',
                 run_name="__main__",alter_sys=True)
#runpy.run_module('official.vision.beta.projects.assemblenet.modeling.assemblenet_plus_test',
# run_name="__main__",alter_sys=True)