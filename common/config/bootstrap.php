<?php
Yii::setAlias('@common', dirname(__DIR__));
Yii::setAlias('@frontend', dirname(dirname(__DIR__)) . '/frontend');
Yii::setAlias('@backend', dirname(dirname(__DIR__)) . '/backend');
Yii::setAlias('@console', dirname(dirname(__DIR__)) . '/console');


//图片上传路径
Yii::setAlias('@uploadPath', dirname(dirname(__DIR__)) . '/uploads');

//api
Yii::setAlias('@api', dirname(dirname(__DIR__)) . '/api');
