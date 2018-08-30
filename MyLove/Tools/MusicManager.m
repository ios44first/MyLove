//
//  MusicManager.m
//  MyLove
//
//  Created by mac on 14/10/23.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "MusicManager.h"

static MusicManager *instencePlayer;

@implementation MusicManager

+ (MusicManager *)getPlayer
{
    if (!instencePlayer)
    {
        instencePlayer = [MusicManager new];
        instencePlayer.musicNames = @[@"我好喜欢你-六哲",@"下雨天-南拳妈妈",@"小情歌-苏打绿"];
        instencePlayer.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:instencePlayer.musicNames[0] ofType:@"mp3"]] error:nil];
        instencePlayer.player.delegate = instencePlayer;
    }
    return instencePlayer;
}

+ (void)play
{
    if (!instencePlayer)
    {
        instencePlayer = [MusicManager getPlayer];
    }
    [instencePlayer.player play];
}

+ (void)pause
{
    if (!instencePlayer)
    {
        instencePlayer = [MusicManager getPlayer];
    }
    [instencePlayer.player pause];
}

+ (void)nextPlay
{
    static int index = 0;
    index++;
    if (index >= instencePlayer.musicNames.count)
    {
        index = 0;
    }
    [instencePlayer.player stop];
    instencePlayer.player = nil;
    instencePlayer.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:instencePlayer.musicNames[index] ofType:@"mp3"]] error:nil];
    instencePlayer.player.delegate = instencePlayer;
    [instencePlayer.player play];
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [MusicManager nextPlay];
}

@end
