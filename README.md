### Template for Boost-wrapped C++ code in python, using CMSSW and ROOT and numpy
Lots of scary words in the title, so I'm surprised it all worked out.


#### Instructions
```bash
# Set up environment. Note, the boost and python paths would need to be tweaked in newer/older releases.
cmsrel CMSSW_9_2_8
cd CMSSW_9_2_8
cmsenv
cd .. 
# Compile
make
# Test
python test_random.py
```
