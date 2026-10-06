# Impacto y Objetivos de Desarrollo Sostenible

## El problema, en cifras reales

| Dato | Fuente |
|---|---|
| Cerca del **75 %** de los cultivos del mundo que producen frutos y semillas para consumo humano dependen, al menos en parte, de polinizadores. | FAO, Día Mundial de las Abejas 2023 |
| La producción colombiana de miel cubría apenas **~30 %** de la demanda nacional; el resto se importaba (Argentina, Chile, México). Consumo per cápita: **87 g/año**. | Agronegocios, 2021 |
| Colombia tenía **más de 135.000 colmenas** en **4.071 apiarios**, con un crecimiento del 49 % en colmenas desde 2015. | Agronegocios, 2021 |
| En 2022 se produjeron cerca de **7.000 toneladas** de miel, con ~**10.000 empleos** directos e indirectos en **22 departamentos**. | CONtexto Ganadero, 2023 |
| La **Ley 2193 de 2022** (fomento apícola) busca financiación favorable, asistencia técnica en sanidad de colmenas, normas de calidad y acciones contra la falsificación. | CONtexto Ganadero, 2023 |

**Lectura:** el sector crece, tiene respaldo legal y una demanda que el país no alcanza a cubrir. Lo que falta es **información conectada**: hoy el productor, la colmena, el lote y el consumidor viven en cuadernos y chats separados.

## Qué resuelve API-KONNECT

| Dolor | Respuesta del sistema | Dónde está en el modelo |
|---|---|---|
| El apicultor vende a intermediarios y no conoce su mercado | Venta directa productor → consumidor por mercado y municipio | `mercado`, `pedido`, `detalle_pedido` |
| Pérdida de colmenas detectada tarde | Sensores + alertas de temperatura y humedad | `sensor`, `medicion_ambiental`, `alerta` |
| Miel adulterada, sin origen verificable | Trazabilidad de cada venta hasta el lote, la cosecha, el apiario y el apicultor | `lote`, `cosecha`, `apiario` |
| Sanidad sin historial | Registro clínico por apiario | `registro_clinico` |
| Productores aislados, sin crédito | Cooperativas, comunidades y entidades financieras conectadas | `cooperativa`, `entidad_financiera` |
| Solo se vende miel | Seis productos de la colmena con precio y unidad propios | `producto`, `lote_producto` |

## Beneficio por dimensión

- **Alimentación.** Más colmenas sanas significan más polinización de cultivos y más producción nacional de miel para cubrir una demanda que hoy se importa.
- **Salud.** El consumidor sabe de qué colmena viene lo que compra, y el registro sanitario de cada apiario deja evidencia de calidad. Las colmenas también se cuidan mejor con alertas tempranas.
- **Economía rural.** El productor vende directo, conoce sus ventas por municipio y diversifica con polen, propóleo, jalea real, cera y apitoxina.
- **Economía sostenible.** Producir más sin talar: la apicultura convive con el bosque y lo necesita en pie.
- **Impacto social.** Cooperativas, comunidades, intercambio entre productores, empleo rural registrado y eventos de capacitación.
- **Economía emergente.** Datos del sector que hoy no existen de forma ordenada: base para crédito, certificación y nuevos negocios (polinización como servicio, productos de alto valor).

## Relación con los ODS de Naciones Unidas

| ODS | Cómo contribuye API-KONNECT |
|---|---|
| **1 · Fin de la pobreza** | Ingreso directo y más estable para familias apicultoras rurales |
| **2 · Hambre cero** | Protege a los polinizadores de los que depende la producción de alimentos |
| **3 · Salud y bienestar** | Trazabilidad y registro sanitario: productos de origen verificable |
| **8 · Trabajo decente y crecimiento económico** | Formaliza ventas y registra empleo en la cadena apícola |
| **9 · Industria, innovación e infraestructura** | IoT, datos e infraestructura digital para el campo |
| **12 · Producción y consumo responsables** | Del frasco a la colmena: el consumidor sabe qué compra y de dónde viene |
| **15 · Vida de ecosistemas terrestres** | Monitoreo y cuidado de colonias de abejas, clave para la biodiversidad |
| **17 · Alianzas para lograr los objetivos** | Conecta productores, cooperativas, financiadores, reguladores e investigadores |

## Fuentes

- [FAO — Palabras del Director General, Día Mundial de las Abejas 2023](https://www.fao.org/director-general/speeches/details/World-Bee-Day-2023-Opening-Remarks/es)
- [Agronegocios — La producción anual del sector apícola solo cubre un tercio de la demanda nacional (2021)](https://www.agronegocios.co/agricultura/la-produccion-anual-del-sector-apicola-solo-cubre-un-tercio-de-la-demanda-nacional-3198053)
- [Agronegocios — Granjas de apicultura han crecido 10 % anual (2021)](https://www.agronegocios.co/agricultura/granjas-de-apicultura-han-crecido-10-anual-en-el-pais-durante-los-ultimos-cinco-anos-3169098)
- [CONtexto Ganadero — Panorama de la apicultura, un año de la ley de fomento apícola (2023)](https://www.contextoganadero.com/agricultura/panorama-de-la-apicultura-en-colombia-un-ano-de-la-ley-de-fomento-apicola)
