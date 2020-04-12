# RicianNet
RicianNet for MRI denoising      

#reader should unzip the file named matconvnet-1.0-beta24.rar  
#your computer should have a successful matcaffe environment

The Code is created based on the method described in the following paper:   
[1] Progressively distribution-based Rician noise removal for magnetic resonance imaging, ISMRM 2018, Oral.     
Authors: Q. Liu, S. Li, J. Lv, D. Liang   
[2] MRI Denoising using Progressively Distribution-based Neural Network, Magnetic Resonance Imaging, 2020.   
Authors: S. Li, J. Zhou, D. Liang, Q. Liu  
Date : 09/2018   
Version : 1.0   

The code and the algorithm are for non-comercial use only.   
Copyright 2018, Department of Electronic Information Engineering, Nanchang University.   




## The flowchart of RicianNet for MRI denoising
![repeat-MDAEP](https://github.com/yqx7150/RicianNet/blob/master/result/The%20schematic%20flowchart%20of%20RicianNet%20model.png)
The Conv and ReLU layers are denoted as "C"and"R",respectively.The ResNet and ResNet are denoted as "Res" and "ResB",respectively.

## Network architecture of RicianNet
<div align=center><img src="./result/Network%20architecture.png"/></div> 

## Visual quality comparison on a T1-weighted Brain1 image corrupted with Rician noise level of 5%. 
<div align=center><img src="./result/Noiselevel5.png"/></div> 
    
From left to right: ground truth image, Rician noisy image and images denoised by NLM, UNLM, BM3D-VST and RicianNet. The corresponding residual images are listed at the second row.


## Other Related Projects
  * Variable augmented neural network for decolorization and multi-exposure fusion [<font size=5>**[Paper]**</font>](https://www.sciencedirect.com/science/article/abs/pii/S1566253517305298)   [<font size=5>**[Code]**</font>](https://github.com/yqx7150/DecolorNet_FusionNet_code)   [<font size=5>**[Slide]**</font>](https://github.com/yqx7150/EDAEPRec/tree/master/Slide)
  
  * IFR-Net: Iterative Feature Refinement Network for Compressed Sensing MRI [<font size=5>**[Paper]**</font>](https://ieeexplore.ieee.org/document/8918016)   [<font size=5>**[Code]**</font>](https://github.com/yqx7150/IFR-Net-Code)
    
  * Iterative scheme-inspired network for impulse noise removal [<font size=5>**[Paper]**</font>](https://link.springer.com/article/10.1007/s10044-018-0762-8)   [<font size=5>**[Code]**</font>](https://github.com/yqx7150/IIN-Code)

  * A Comparative Study of CNN-based Super-resolution Methods in MRI Reconstruction and Its Beyond [<font size=5>**[Paper]**</font>](https://sciencedirect.xilesou.top/science/article/abs/pii/S0923596519302358)   [<font size=5>**[Code]**</font>](https://github.com/yqx7150/DCCN)

  * Complex-valued MRI data from SIAT   [<font size=5>**[Data]**</font>](https://github.com/yqx7150/EDAEPRec/tree/master/test_data_31)
