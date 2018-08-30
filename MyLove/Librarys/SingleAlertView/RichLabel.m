//
//  RichLabel.m
//  SOHUAssistant
//
//  Created by wyy on 13-11-18.
//  Copyright (c) 2013年 uway_soft. All rights reserved.
//

#import "RichLabel.h"
#import <CoreText/CoreText.h>
#import<Foundation/Foundation.h>
@implementation RichLabel
@synthesize lineSpace = lineSpace_;
@synthesize charSpace = charSpace_;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        lineSpace_ = 1.0;
        charSpace_ = 1.0;
        _isSetStyle=NO;
        _string = [[NSMutableAttributedString alloc]init];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    lineSpace_ = 1.0;
    charSpace_ = 1.0;
}

-(void)dealloc{
    
    _string=nil;
}

-(void)setCharSpace:(CGFloat)charSpace{
    charSpace_ = charSpace;
    //[self setNeedsDisplay];
}
-(void)setLineSpace:(CGFloat)lineSpace{
    lineSpace_ = lineSpace;
    //[self setNeedsDisplay];
    
}

-(void)setText:(NSString *)text WithFont:(UIFont *)font AndColor:(UIColor *)color{
    if (text==nil) {
        return;
    }
    self.text = text;
    [_string setAttributedString:[[NSAttributedString alloc]initWithString:text]];
    int len = [text length];
    [self.string  addAttribute:(NSString *)(kCTForegroundColorAttributeName) value:(id)color.CGColor range:NSMakeRange(0, len)];
    CTFontRef ctFont2 = CTFontCreateWithName((__bridge CFStringRef)(((font.fontName))), font.pointSize,NULL);
    [self.string  addAttribute:(NSString *)(kCTFontAttributeName) value:CFBridgingRelease(ctFont2) range:NSMakeRange(0, len)];

}

-(void)setKeyWordTextString:(NSString *)keyWordArray WithFont:(UIFont *)font AndColor:(UIColor *)keyWordColor{
    
    if (keyWordArray==nil) {
        return;
    }
    NSMutableArray *rangeArray = [[NSMutableArray alloc]init];
    NSRange range = [self.text rangeOfString:keyWordArray];
    NSValue *value = [NSValue valueWithRange:range];
    if (range.length > 0) {
        [rangeArray addObject:value];
    }
    for (NSValue *value in rangeArray) {
        NSRange keyRange = [value rangeValue];
        [self.string  addAttribute:(NSString *)(kCTForegroundColorAttributeName) value:(id)keyWordColor.CGColor range:keyRange];
        CTFontRef ctFont1 = CTFontCreateWithName((__bridge CFStringRef)((font.fontName)), font.pointSize,NULL);
        [self.string  addAttribute:(NSString *)(kCTFontAttributeName) value:CFBridgingRelease(ctFont1) range:keyRange];
        //CFRelease(ctFont1);
        
    }
    rangeArray=nil;
}


- (CGFloat)boundingHeightForWidth:(CGFloat)inWidth
{
    _isSetStyle=YES;
    [self setValueForLabel];
    CTFramesetterRef framesetter =CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)((self.string)));
    CGSize suggestedSize =CTFramesetterSuggestFrameSizeWithConstraints(framesetter,CFRangeMake(0, 0), NULL,CGSizeMake(inWidth, CGFLOAT_MAX), NULL);
    CFRelease(framesetter);
    _mode=kCTLineBreakByWordWrapping;
    return suggestedSize.height;

}
//设置换行模式
-(void)setRichLinebreakMode:(CTLineBreakMode)breakmode{

    _mode=breakmode;
}

-(void)setValueForLabel{

    
    //设置字间距
    
    long number = self.charSpace;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [self.string  addAttribute:(id)kCTKernAttributeName value:CFBridgingRelease(num) range:NSMakeRange(0,[self.string  length])];

    
    CTTextAlignment alignment = kCTLeftTextAlignment;
    
    if(self.textAlignment == NSTextAlignmentCenter)
        
    {
        alignment = kCTCenterTextAlignment;
        
    }
    
    if(self.textAlignment == NSTextAlignmentRight)
        
    {
        
        alignment = kCTRightTextAlignment;
        
    }
    
    CTParagraphStyleSetting alignmentStyle;
    
    alignmentStyle.spec = kCTParagraphStyleSpecifierAlignment;
    
    alignmentStyle.valueSize = sizeof(alignment);
    
    alignmentStyle.value = &alignment;
    
    
    //设置文本行间距
    
    CGFloat lineSpace = self.lineSpace;
    
    CTParagraphStyleSetting lineSpaceStyle;
    
    lineSpaceStyle.spec = kCTParagraphStyleSpecifierLineSpacingAdjustment;
    
    lineSpaceStyle.valueSize = sizeof(lineSpace);
    
    lineSpaceStyle.value =&lineSpace;
    
    //段落
    
    CGFloat paragraphSpacing = 0;
    
    CTParagraphStyleSetting paragraphSpaceStyle;
    
    paragraphSpaceStyle.spec = kCTParagraphStyleSpecifierParagraphSpacing;
    
    paragraphSpaceStyle.valueSize = sizeof(CGFloat);
    
    paragraphSpaceStyle.value = &paragraphSpacing;
    
    //换行模式
    CTParagraphStyleSetting lineBreakMode;
    CTLineBreakMode lineBreak =_mode; 
    lineBreakMode.spec = kCTParagraphStyleSpecifierLineBreakMode;
    lineBreakMode.value = &lineBreak;
    lineBreakMode.valueSize = sizeof(CTLineBreakMode);
    

    //创建设置数组
    
    CTParagraphStyleSetting settings[ ] ={alignmentStyle,lineSpaceStyle,paragraphSpaceStyle,lineBreakMode};
    
    CTParagraphStyleRef style = CTParagraphStyleCreate(settings ,4);
    
    //给文本添加设置
    
    [self.string  addAttribute:(id)kCTParagraphStyleAttributeName value:CFBridgingRelease(style) range:NSMakeRange(0 , [self.string  length])];
    
}


-(void) drawTextInRect:(CGRect)requestedRect
{

    if (!_isSetStyle) {
        [self setValueForLabel];
    }

    //排版
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)((self.string)));
    
    CGMutablePathRef leftColumnPath = CGPathCreateMutable();
    
    CGPathAddRect(leftColumnPath, NULL ,CGRectMake(0 , 0 ,self.bounds.size.width , self.bounds.size.height));
    
    CTFrameRef leftFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0, 0), leftColumnPath , NULL);
    
    //翻转坐标系统（文本原来是倒的要翻转下）
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIGraphicsPushContext(context);
    
    CGContextSetTextMatrix(context , CGAffineTransformIdentity);
    
    CGContextTranslateCTM(context , 0 ,self.bounds.size.height);
    
    CGContextScaleCTM(context, 1.0 ,-1.0);
    
    //画出文本
    
    CTFrameDraw(leftFrame,context);
    
    UIGraphicsPopContext();
    //释放
    
    CGPathRelease(leftColumnPath);
    CFRelease(framesetter);
    CFRelease(leftFrame);
    //[super drawRect:rect];
}

@end


@implementation myUILabel
@synthesize verticalAlignment = verticalAlignment_;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentMiddle;
    }
    return self;
}

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    verticalAlignment_ = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}


@end