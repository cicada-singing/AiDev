package com.aidev.common.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.Getter;

/**
 * 用户会话
 *
 * @author aidev
 */
@Getter
public enum OnlineStatus {
    on_line("on_line", "在线"), off_line("off_line", "离线");

    @EnumValue
    private final String code;
    private final String info;

    OnlineStatus(String code, String info) {
        this.code = code;
        this.info = info;
    }
}
