//
//  SCImageHolder.h
//  SCRecorder
//
//  Created by Simon CORSIN on 13/09/14.
//  Copyright (c) 2014 rFlex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>

@protocol CIImageRenderer <NSObject>

/**
 The CIImage to display
 */
@property (strong, nonatomic) CIImage *CIImage;

@optional

/**
 Some objects may use this property to set a buffer instead of always creating
 a CIImage. This avoids creating multiple CIImage if it is not necesarry.
 */
- (void)setImageBySampleBuffer:(CMSampleBufferRef)sampleBuffer;

/**
 Some objects such as the SCPlayer may need to set a transform.
 */
@property (assign, nonatomic) CGAffineTransform transform;

/**
 Some objects such as the SCPlayer may need to get a frame.
 */
@property (readonly, nonatomic) CGRect frame;

@end