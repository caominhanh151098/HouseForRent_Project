package com.example.casestudy_hotelproject.util;

import org.modelmapper.AbstractConverter;
import org.modelmapper.Converter;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class AppUtils {
    public static final ModelMapper mapper;

    static {
        mapper = new ModelMapper();
        mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
        mapper.getConfiguration().setFieldMatchingEnabled(true);
        Converter<String, LocalDate> toStringDate = new AbstractConverter<>() {
            @Override
            protected LocalDate convert(String source) {
                DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                return LocalDate.parse(source, format);
            }
        };


        mapper.createTypeMap(String.class, LocalDate.class);
        mapper.addConverter(toStringDate);
    }
}
