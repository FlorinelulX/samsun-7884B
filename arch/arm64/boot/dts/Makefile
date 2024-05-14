# SPDX-License-Identifier: GPL-2.0
dtb-y += exynos/dtb/exynos7885.dtb \
	exynos/dtb/exynos7885-jackpotlte_eur_open_03.dtb \
	exynos/dtb/exynos7885-jackpotlte_eur_open_04.dtb \
	exynos/dtb/exynos7885-jackpotlte_eur_open_05.dtb \
	exynos/dtb/exynos7885-jackpotlte_eur_open_06.dtb \
	exynos/dtb/exynos7885-jackpotlte_eur_open_07.dtb \
	exynos/dtb/exynos7885-jackpotlte_can_open_03.dtb \
	exynos/dtb/exynos7885-jackpotlte_can_open_04.dtb \
	exynos/dtb/exynos7885-jackpotlte_can_open_05.dtb \
	exynos/dtb/exynos7885-jackpotlte_can_open_06.dtb \
	exynos/dtb/exynos7885-jackpotlte_can_open_07.dtb \
	exynos/dtb/exynos7885-jackpotlte_kor_03.dtb \
	exynos/dtb/exynos7885-jackpotlte_kor_04.dtb \
	exynos/dtb/exynos7885-jackpotlte_kor_05.dtb \
	exynos/dtb/exynos7885-jackpotlte_kor_06.dtb \
	exynos/dtb/exynos7885-jackpotlte_kor_07.dtb
dtbo-y += exynos/dtbo/exynos7884B-a10eu_jpn_dcm_01.dtbo
dtbo-y += exynos/dtbo/exynos7884B-a10eu_jpn_dcm_00.dtbo

targets += dtbs
DTB_LIST  := $(dtb-y) $(dtbo-y)
always    := $(DTB_LIST)

dtbs: $(addprefix $(obj)/, $(DTB_LIST))

clean-files := *.dtb*
