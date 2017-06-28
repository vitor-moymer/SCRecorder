//
//  SCVideoBuffer.m
//  SCRecorder
//
//  Created by Simon CORSIN on 02/07/15.
//  Copyright (c) 2015 rFlex. All rights reserved.
//

#import "SCIOPixelBuffers.h"

@implementation SCIOPixelBuffers

- (instancetype)initWithInputPixelBuffer:(CVPixelBufferRef)inputPixelBuffer outputPixelBuffer:(CVPixelBufferRef)outputPixelBuffer time:(CMTime)time {
    self = [super init];
    
    if (self) {
        _inputPixelBuffer = inputPixelBuffer;
        _outputPixelBuffer = outputPixelBuffer;
        _time = time;
        
        CVPixelBufferRetain(inputPixelBuffer);
        CVPixelBufferRetain(outputPixelBuffer);
    }
    
    return self;
}

- (void)dealloc {
    CVPixelBufferRelease(_inputPixelBuffer);
    CVPixelBufferRelease(_outputPixelBuffer);
}

- (void)setInputPixelBuffer:(CVPixelBufferRef)inputPixelBuffer {
    
    if (_inputPixelBuffer != nil) {
        CVPixelBufferRelease(_inputPixelBuffer);
        _inputPixelBuffer = nil;
    }
    
    _inputPixelBuffer = inputPixelBuffer;
    
    if (inputPixelBuffer != nil) {
        CVPixelBufferRetain(inputPixelBuffer);
    }
    
}
-(void)setOutputPixelBuffer:(CVPixelBufferRef)outputPixelBuffer {
    if (_outputPixelBuffer != nil) {
        CVPixelBufferRelease(_outputPixelBuffer);
        _outputPixelBuffer = nil;
    }
    
    _outputPixelBuffer = outputPixelBuffer;
    
    if (outputPixelBuffer != nil) {
        CVPixelBufferRetain(outputPixelBuffer);
    }
}

+ (SCIOPixelBuffers *)IOPixelBuffersWithInputPixelBuffer:(CVPixelBufferRef)inputPixelBuffer outputPixelBuffer:(CVPixelBufferRef)outputPixelBuffer time:(CMTime)time {
    return [[SCIOPixelBuffers alloc] initWithInputPixelBuffer:inputPixelBuffer outputPixelBuffer:outputPixelBuffer time:time];
}

@end
