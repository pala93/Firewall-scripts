#!/usr/local/bin/perl
use warnings;
use strict;

my $clear_file = `> /etc/blocked_sites.txt`;

my $host;
my @block_list = (
        'kaspersky.ru',
        'drweb.ru',
        'avia.yandex.ru',
        'auto.ru',
        'audience.yandex.ru',
        'afisha.yandex.ru',
        'webmaster.yandex.ru',
        'yandex.ru',
        'direct.yandex.ru',
        'disk.yandex.ru',
        'delivery.yandex.ru',
        'calendar.yandex.ru',
        'kassa.yandex.ru',
        'www.kinopoisk.ru',
        'market.yandex.ru',
        'metrika.yandex.ru',
        'metro.yandex.ru',
        'music.yandex.ua',
        'realty.yandex.ru',
        'news.yandex.ru',
        'translate.yandex.ru',
        'mail.yandex.ua',
        'pdd.yandex.ru',
        'travel.yandex.ru',
        'rabota.yandex.ru',
        'radio.yandex.ua',
        'rasp.yandex.ru',
        'partner.yandex.ru',
        'sprav.yandex.ru',
        'stat.yandex.ru',
        'taxi.yandex.ru',
        'tv.yandex.ru',
        'telephony.yandex.ru',
        'tech.yandex.ru',
        'fotki.yandex.ru',
        'money.yandex.ru',
        'dns.yandex.ru',
        'browser.yandex.ru',
        'speechkit.yandex.ru',
        'xml.yandex.ru',
        'yandexdatafactory.com',
        'avia.yandex.ua',
        'audience.yandex.ua',
        'afisha.yandex.ua',
        'yandex.ua',
        'disk.yandex.ua',
        'direct.yandex.ua',
        'sprav.yandex.ua',
        'zno.yandex.ua',
        'market.yandex.ua',
        'metrika.yandex.ua',
        'metro.yandex.ua',
        'n.maps.yandex.ru',
        'news.yandex.ua',
        'translate.yandex.ua',
        'yandex.ua',
        'site.yandex.ua',
        'rabota.yandex.ua',
        'rasp.yandex.ua',
        'partner.yandex.ua',
        'passport.yandex.ua',
        'stat.yandex.ua',
        'tv.yandex.ua',
        'dns.yandex.ua',
        'browser.yandex.ua',
        'xml.yandex.ua',
        'ok.ru',
        'vk.com',
        'm.vk.com',
        'm.ok.ru',
        'mail.ru',
        'x90.im'

         );

my $count_sites = @block_list;
        for (my $i=0;$i<$count_sites;$i++) {
                $host = `host $block_list[$i] | grep 'has address' | cut -d ' ' -f 4 >> /etc/blocked_sites.txt`;
                                           }
my $block_ip_list = `cat /etc/blocked_sites.txt | /usr/bin/sort | /usr/bin/uniq`;

my $filename = '/etc/blocked_sites.txt';
open(my $fh, '>', $filename) or die "Ne mogu otkrit file '$filename' $!";
print $fh "$block_ip_list";
close $fh;

my $firewall_restart=`/etc/rc.d/ipfw restart`;



